import Ember from 'ember'

TechStackPhysicsComponent = Ember.Component.extend(

  # Initialize Matterjs only after ember
  # has rendered its template into DOM
  didInsertElement: ->

    # Module aliases
    Engine = Matter.Engine
    Render = Matter.Render
    Runner = Matter.Runner
    Composites = Matter.Composites
    Common = Matter.Common
    MouseConstraint = Matter.MouseConstraint
    Mouse = Matter.Mouse
    World = Matter.World
    Bodies = Matter.Bodies

    # Create an engine
    engine = Engine.create()
    world = engine.world

    # Create a renderer
    render = Render.create({
        element: @$('#techstack-physics')[0],
        engine: engine,
        options: {
            width: 180,
            height: 360,
            background: 'transparent',
            wireframes: false,
            showVelocity: true,
            showAngleIndicator: false
        }
    })

    Render.run(render)

    # create runner
    runner = Runner.create()
    Runner.run(runner, engine)

    # add bodies
    offset = 10
    options = {
        isStatic: true,
        render: {
          fillStyle: '#b3b3b3ff',
          strokeStyle: '#b3b3b3ff',
          lineWidth: 1
        }
    }

    world.bodies = [];

    # Create static walls: Define Top, Bottom, Right, Left
    World.add(world, [
        Bodies.rectangle(400, -495, 780, 1, options),
        Bodies.rectangle(400, 1095, 780, 1, options),
        Bodies.rectangle(5, 300, 1, 1600, options),
        Bodies.rectangle(795, 300, 1, 1600, options)
    ])

    counter = 1
    stack = Composites.stack(25, 20, 4, 6, 0, 0, (x, y) ->
              if counter == 1
                counter += 1
                Bodies.rectangle(x, y, 235, 235, {
                  render:
                    sprite:
                      texture: 'assets/images/emberjs-logo.svg'
                      url: 'http://emberjs.com/'
                      xScale: 2
                      yScale: 2
                })
              else if counter == 2
                counter += 1
                Bodies.circle(x, y, 105, {
                  density: 0.0005
                  frictionAir: 0.06
                  restitution: 0.3
                  friction: 0.01
                  render:
                    sprite:
                      texture: 'assets/images/coffeescript-logo.svg'
                      url: 'http://coffeescript.org/'
                      xScale: 2
                      yScale: 2
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
                      url: 'http://broccolijs.com/'
                      xScale: 0.85
                      yScale: 0.85
                })
              else if counter == 4
                counter += 1
                Bodies.rectangle(x, y, 200, 200, {
                  render:
                    sprite:
                      texture: 'assets/images/html5-logo.svg'
                      url: 'http://www.w3.org/html/'
                      xScale: 0.4
                      yScale: 0.4
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
                      url: 'http://handlebarsjs.com/'
                      xScale: 0.85
                      yScale: 0.85
                })
              else if counter == 6
                counter += 1
                Bodies.rectangle(x, y, 180, 180, {
                  render:
                    sprite:
                      texture: 'assets/images/bootstrap-logo.svg'
                      url: 'http://getbootstrap.com/'
                      xScale: 1.35
                      yScale: 1.35
                })
              else if counter == 7
                counter += 1
                Bodies.rectangle(x, y, 350, 100, {
                  render:
                    sprite:
                      texture: 'assets/images/jquery-logo.svg'
                      url: 'http://jquery.com/'
                      xScale: 1.35
                      yScale: 1.35
                })
              else if counter == 8
                counter += 1
                Bodies.rectangle(x, y, 350, 85, {
                  render:
                    sprite:
                      texture: 'assets/images/impress-js-logo.svg'
                      url: 'https://github.com/impress/impress.js'
                      xScale: 1
                      yScale: 1
                })
              else if counter == 9
                counter += 1
                Bodies.rectangle(x, y, 225, 225, {
                  render:
                    sprite:
                      texture: 'assets/images/mapbox-logo.svg'
                      url: 'https://www.mapbox.com/'
                      xScale: 1.15
                      yScale: 1.15
                })
              else if counter == 10
                counter += 1
                Bodies.rectangle(x, y, 255, 180, {
                  render:
                    sprite:
                      texture: 'assets/images/matter-js-logo.svg'
                      url: 'http://brm.io/matter-js/'
                      xScale: 0.80
                      yScale: 0.80
                })
          )

    # Add all bodies to the world
    World.add(world, stack)

    # Setup event handler
    mouse = Mouse.create(render.canvas)
    mouseConstraint = MouseConstraint.create(engine, {
                          mouse: mouse,
                          constraint: {
                              stiffness: 0.2,
                              render: {
                                  visible: false
                              }
                          }
                      })
    World.add(world, mouseConstraint)

    # keep the mouse in sync with rendering
    render.mouse = mouse

    # fit the render viewport to the scene
    Render.lookAt(render, {
        min: { x: 0, y: 0 },
        max: { x: 800, y: 600 }
    })

    # context for MatterTools.Demo
    context = {
        engine: engine,
        runner: runner,
        render: render,
        canvas: render.canvas,
        stop: ->
          Matter.Render.stop(render)
          Matter.Runner.stop(runner)
    }

    return context
)

export default TechStackPhysicsComponent
