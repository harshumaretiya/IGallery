class MeetingsController < InheritedResources::Base

  private

    def meeting_params
      params.require(:meeting).permit(:name, :start_time)
    end

end
