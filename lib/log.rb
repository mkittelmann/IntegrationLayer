class CustomFormater < Logger::Formater
  def call(severity, time, progname, msg)
   # msg2str is the internal helper that handles different msgs correctly
    "#{time} - #{msg2str(msg)}"
  end
end


# To enable log rotation, pass 'monthly', 'weekly', or 'daily' to the Logger constructor. Optionally, you can pass a maximum file size and number of files to to keep in rotation to the constructor.
logger = Logger.new File.new('val2fart.log', 'monthly')
log.level = Logger::WARN

log.debug "This will be ignored"
log.error "This will not be ignored"


logger.debug "debugging info"
logger.info "general logs"
logger.warn "oh my…this isn't good"
logger.error "boom!"
logger.fatal "oh crap…"


logger.error "Something blew up!"
logger.error ex



logger.info 'worker' { 'doing hard work' }




