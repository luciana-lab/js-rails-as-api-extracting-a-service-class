class SightingSerializer
    # we use the initialize method to set up any instance variables that we might want to share over multiple methods
    # initialize will take in whatever variable we're dealing with in a particular action, and store it as an instance variable
    def initialize(sighting_object)
        @sighting = sighting_object
    end

    def to_serialized_json
        # @sighting.to_json(:include => {
        #     :bird => {:only => [:name, :species]},
        #     :location => {:only => [:latitude, :longitude]}
        # }, :except => [:updated_at])

        options = {
            include: {
                bird: {
                    only: [:name, :species]
                },
                location: {
                    only: [:latitude, :longitude]
                }
            },
            except: [:updated_at],
        }
        @sighting.to_json(options)

    end
end