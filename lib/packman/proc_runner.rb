require 'open3'

class ProcRunner
  def self.run(*args)
    runner = new
    yield runner
    runner.start!(*args)
  end
  
  def start!(*args)
    Open3.popen3(*args) do |stdin, stdout, stderr, wait_thr|
      @pid = wait_thr.pid
      begin
        @started.call if @started
        while true
          line = stdout.readline
          @each_line.call(line) if @each_line
        end
      rescue EOFError
      end
      exit_status = wait_thr.value
    end
  end
  
  def kill!
    Process.kill(:TERM, @pid)
  end
  
  def started(&blk); @started = blk; end
  def each_line(&blk); @each_line = blk; end
  def exited(&blk); @exited = blk; end
end