function ze () {
	zeus $@
	if [ $? -eq 143 ]
	then
	  reset
	  echo ‘########################################################’
	  echo ‘Caught a zeus error, reset terminal and now retrying...’
	  ze $@
	fi
}

alias z=ze
alias zg='z generate'
alias zgm='zg migration'
alias zst='z start'
alias zs='z spec'
alias zss='z spec spec'
alias zr='zeus rake'
alias zrdm='zr db:migrate'
alias zrdms='zr db:migrate:status'
alias zrdr='zr db:rollback'
alias zrdtp='zr db:test:prepare'
