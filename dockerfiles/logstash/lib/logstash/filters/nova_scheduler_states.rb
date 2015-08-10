# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"

# This nova_scheduler_states filter will parse filtered / weighed objects,
# split using regex, then generate event for each state entry found. The
# generated event can be used for next step processing like kv filter, so that
# ES can visualize the resource state change based on these information.
class LogStash::Filters::Nova_scheduler_states < LogStash::Filters::Base

  config_name "nova_scheduler_states"
  
  config :states_field_name, :validate => :string, :default => ""
  

  public
  def register
    # Add instance variables 
  end # def register

  public
  def filter(event)
    return unless filter?(event)

    if @states_field_name and @states_field_name.is_a?(String)
      # (host1, host1.domain) ram:1234 disk:4321 io_ops:0 instances:6, ...
      entries = event[@states_field_name].split(/,(?= \()/)

      entries.each_with_index { |state_entry, index|
        state_entry = state_entry.strip

        # generate new event per obj state parsed
        if match = state_entry.match(/(\(.*\)) (.*)/i)
          state_key, state_value = match.captures
          state_event = event.clone
          state_event["type"] = "state_entry"
          state_event["state_total"] = entries.length
          state_event["state_index"] = index

          # `(host1, host1.domain)` for state_key
          state_event["state_key"] = state_key
          # `ram:1234 disk:4321 io_ops:0 instances:6` for state_value
          state_event["state_value"] = state_value
          # `host1` for state_host
          state_host = state_key.gsub(/[()]/, "").split(/,/)[0]
          state_event["state_host"] = state_host

          yield state_event
        end # if match
      }
    end # if @states_field_name

    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Nova_scheduler_states
