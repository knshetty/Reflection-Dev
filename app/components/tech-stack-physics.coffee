import Ember from 'ember'

TechStackPhysicsComponent = Ember.Component.extend(

  # Initialize Matterjs only after ember
  # has rendered its template into the DOM
  didInsertElement: ->

    # **************************************************************************
    # Module aliases
    # **************************************************************************
    Engine = Matter.Engine
    Render = Matter.Render
    Runner = Matter.Runner
    Composites = Matter.Composites
    Common = Matter.Common
    Events = Matter.Events
    MouseConstraint = Matter.MouseConstraint
    Mouse = Matter.Mouse
    World = Matter.World
    Bodies = Matter.Bodies
    Bounds = Matter.Bounds

    # **************************************************************************
    # Create an Engine & run
    # **************************************************************************
    engine = Engine.create()
    Runner.run(Runner.create(), engine)

    # **************************************************************************
    # Create a Renderer & run
    # **************************************************************************
    render = Render.create({
                element: @$('#techstack-physics')[0]
                engine: engine
                options:
                  width: 180
                  height: 360
                  background: 'transparent'
                  wireframes: false
                  showVelocity: true
                  showAngleIndicator: false
            })

    Render.run(render)

    # Fit the render viewport to the scene
    Render.lookAt(render, {
        min:
          x: 0
          y: 0
        max:
          x: 800
          y: 600
    })

    # **************************************************************************
    # Create Bodies & add these Bodies to the World
    # **************************************************************************

    # Initialise Bodies of the World
    world = engine.world
    world.bodies = [];

    # ---------------------
    # Create Bodies - Set 1
    # ---------------------
    # Four Static Walls: Top, Bottom, Right, Left
    wallOptions = {
        isStatic: true
        render: {
          fillStyle: '#b3b3b3ff'
          strokeStyle: '#b3b3b3ff'
          lineWidth: 1
        }
    }
    walls = [Bodies.rectangle(400, -495, 780, 1, wallOptions),
             Bodies.rectangle(400, 1095, 780, 1, wallOptions),
             Bodies.rectangle(5, 300, 1, 1600, wallOptions),
             Bodies.rectangle(795, 300, 1, 1600, wallOptions)]
    World.add(world, walls)

    # ---------------------
    # Create Bodies - Set 2
    # ---------------------
    # Ten Stacked Hyperlinked-Sprites
    counter = 1
    spriteStack = Composites.stack(25, -500, 3, 6, 0, 0, (x, y) ->
              if counter == 1
                counter += 1
                Bodies.rectangle(x, y, 235, 235, {
                  render:
                    sprite:
                      texture: 'assets/images/emberjs-logo.svg'
                      xScale: 2
                      yScale: 2
                  url: 'https://emberjs.com/'
                })
              else if counter == 2
                counter += 1
                Bodies.circle(x, y, 105, {
                  density: 0.0005
                  frictionAir: 0.00
                  restitution: 0.3
                  friction: 0.01
                  render:
                    sprite:
                      texture: 'assets/images/coffeescript-logo.svg'
                      xScale: 2
                      yScale: 2
                  url: 'https://coffeescript.org/'
                })
              else if counter == 3
                counter += 1
                Bodies.circle(x, y, 105, {
                  density: 0.0005
                  frictionAir: 0.06
                  restitution: 0.3
                  friction: 0.01
                  render:
                    sprite:
                      texture: 'assets/images/broccoli-logo.svg'
                      xScale: 0.85
                      yScale: 0.85
                  url: 'https://github.com/broccolijs/broccoli'
                })
              else if counter == 4
                counter += 1
                Bodies.rectangle(x, y, 200, 200, {
                  render:
                    sprite:
                      texture: 'assets/images/html5-logo.svg'
                      xScale: 0.4
                      yScale: 0.4
                  url: 'https://www.w3.org/html/'
                })
              else if counter == 5
                counter += 1
                Bodies.circle(x, y, 105, {
                  density: 0.0005
                  frictionAir: 0.06
                  restitution: 0.3
                  friction: 0.01
                  render:
                    sprite:
                      texture: 'assets/images/handlebars-logo.svg'
                      xScale: 0.85
                      yScale: 0.85
                  url: 'https://handlebarsjs.com/'
                })
              else if counter == 6
                counter += 1
                Bodies.rectangle(x, y, 180, 180, {
                  render:
                    sprite:
                      texture: 'assets/images/bootstrap-logo.svg'
                      xScale: 1.35
                      yScale: 1.35
                  url: 'https://getbootstrap.com/'
                })
              else if counter == 7
                counter += 1
                Bodies.rectangle(x, y, 350, 100, {
                  render:
                    sprite:
                      texture: 'assets/images/jquery-logo.svg'
                      xScale: 1.35
                      yScale: 1.35
                  url: 'https://jquery.com/'
                })
              else if counter == 8
                counter += 1
                Bodies.rectangle(x, y, 225, 225, {
                  render:
                    sprite:
                      texture: 'assets/images/mapbox-logo.svg'
                      xScale: 1.15
                      yScale: 1.15
                  url: 'https://www.mapbox.com/'
                })
              else if counter == 9
                counter += 1
                Bodies.rectangle(x, y, 255, 180, {
                  render:
                    sprite:
                      texture: 'assets/images/matter-js-logo.svg'
                      xScale: 0.80
                      yScale: 0.80
                  url: 'http://brm.io/matter-js/'
                })
              else if counter == 10
                counter += 1
                Bodies.rectangle(x, y, 350, 85, {
                  render:
                    sprite:
                      texture: 'assets/images/impress-js-logo.svg'
                      xScale: 1
                      yScale: 1
                  url: 'https://github.com/impress/impress.js'
                })
              )
    World.add(world, spriteStack)

    # **************************************************************************
    # Add interactivity to the World: Create Mouse Event-Handlers
    # **************************************************************************

    # Create a Mouse-Interactive object & add it to the World
    render.mouse = Mouse.create(render.canvas) # Keep the new mouse-controller in sync with rendering
    mouseInteractivity = MouseConstraint.create(engine, {
                          mouse: render.mouse
                          constraint:
                            stiffness: 0.2
                            render:
                              visible: false
                         })
    World.add(world, mouseInteractivity)

    # Add On-Mouseup Event-Handler
    Events.on(mouseInteractivity, 'mouseup', (event) ->
        mouseConstraint = event.source
        if (!mouseConstraint.bodyB)
          for body in engine.world.composites[0].bodies
            if Bounds.contains(body.bounds, mouseConstraint.mouse.position)
              bodyUrl = body.url
              if bodyUrl != undefined
                window.open(bodyUrl, '_blank')
              break
    )
)

export default TechStackPhysicsComponent
