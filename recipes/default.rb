#
# Cookbook Name:: rattic
# Recipe:: default
#
# Copyright 2015, Kristen Arnold
#

include_recipe 'rattic::packages'
include_recipe 'rattic::database'
include_recipe 'rattic::webapp'
include_recipe 'rattic::apache'
