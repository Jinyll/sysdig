--[[
Copyright (C) 2013-2014 Draios inc.
 
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License version 2 as
published by the Free Software Foundation.


This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

view_info = 
{
	id = "mesos_frameworks",
	name = "Mesos Frameworks",
	description = "List all Mesos frameworks running on this machine, and the resources that each of them uses.",
	tips = {"Select a framework and click enter to drill down into it. At that point, you will be able to access several views that will show you the details of the selected framework."},
	view_type = "table",
	applies_to = {"", "evt.res", "mesos.task.id"},
	filter = "mesos.framework.id != ''",
	use_defaults = true,
	drilldown_target = "mesos_tasks",
	columns = 
	{
		{
			name = "NA",
			field = "thread.tid",
			is_key = true
		},
		{
			name = "CPU",
			field = "thread.cpu",
			description = "Amount of CPU used by the framework.",
			colsize = 8,
			aggregation = "AVG",
			groupby_aggregation = "SUM",
			is_sorting = true
		},
		{
			name = "VIRT",
			field = "thread.vmsize.b",
			description = "Total virtual memory for the framework.",
			aggregation = "MAX",
			groupby_aggregation = "SUM",
			colsize = 9
		},
		{
			name = "RES",
			field = "thread.vmrss.b",
			description = "Resident non-swapped memory for the framework.",
			aggregation = "MAX",
			groupby_aggregation = "SUM",
			colsize = 9
		},
		{
			name = "FILE",
			field = "evt.buflen.file",
			description = "Total (input+output) file I/O bandwidth generated by the framework, in bytes per second.",
			colsize = 8,
			aggregation = "TIME_AVG",
			groupby_aggregation = "SUM"
		},
		{
			name = "NET",
			field = "evt.buflen.net",
			description = "Total (input+output) network bandwidth generated by the framework, in bytes per second.",
			colsize = 8,
			aggregation = "TIME_AVG",
			groupby_aggregation = "SUM"
		},
		{
			name = "NA",
			field = "mesos.framework.name",
			is_groupby_key = true
		},
		{
			name = "ID",
			field = "mesos.framework.id",
			description = "Framework ID.",
			colsize = 38
		},
		{
			name = "NAME",
			field = "mesos.framework.name",
			description = "Framework name.",
			colsize = 25
		}
	}
}
