class TicketsController < ApplicationController
	before_action :authenticate_user!
	
    def index
    end
    
    def show
        @ticket = Ticket.find(params[:id])
    end
    
    def new
		@tournament = Tournament.find(session[:tournament_id])
    end
    
    def edit
    end
    
    def create
		@ticket = Ticket.new(ticket_params)
		@ticket.person = current_person
		@tournament = Tournament.find(session[:tournament_id])
		@ticket.tournament = @tournament
		logger.debug "params[:tickettype] = #{params[:tickettype]}"

		if @ticket.save
			create_player()
			#if params[:tickettype] == 1 
			#	redirect_to :controller => "players", :action => "create"
			#elsif params[:tickettype] == 2 
			#	redirect_to :controller => "sponsor", :action => "create"
			#end
			
			redirect_to @ticket
		else
			render action: "new"
			logger.error "Ticket was not added to database"
		end
    end
    
    def update
    end
    
    def destroy
    end
	
	private 
	def ticket_params
		params.require(:ticket).permit(:tickettype)
	end
	
end