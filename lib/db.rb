#!/usr/bin/env ruby

require 'mysql2'

class DB
  def initialize username, password, host, port, database
    @db = Mysql2::Client.new(host: host, port: port, username: username, password: password, database: database)
  end

  def dump id
    res = @db.query("SELECT * from posts WHERE id=#{id}")
    res.first
  end

  def insert o
    @db.query("INSERT INTO posts (uuid, title, slug, markdown, image, author_id, created_at, created_by) values ('#{o['uuid']}', '#{@db.escape(o['title'])}', '#{o['slug']}', '#{@db.escape(o['markdown'])}', '#{o['image']}', '#{o['author_id']}', now(), '#{o['created_by']}')")
  end
end
