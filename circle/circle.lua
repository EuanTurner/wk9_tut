c = Vector3:new{x=0.5, y=0.5}

radius = 0.5

westPoint  = Vector3:new{x=c.x-radius,  y=c.y}
northPoint = Vector3:new{x=c.x,         y=c.y+radius}
eastPoint  = Vector3:new{x=c.x+radius,  y=c.y}
southPoint = Vector3:new{x=c.x,         y=c.y-radius}

arc1 = Arc:new{p0=westPoint,   p1=northPoint,   centre=c}
arc2 = Arc:new{p0=southPoint,   p1=eastPoint,   centre=c}
arc3 = Arc:new{p0=southPoint,    p1=westPoint,  centre=c}
arc4 = Arc:new{p0=eastPoint,    p1=northPoint,  centre=c}

-- circle = Polyline:new{segments={arc1, arc2, arc3, arc4}}

patch0 = CoonsPatch:new{south=arc2, north=arc1, west=arc3, east=arc4}
grid0 = StructuredGrid:new{psurface=patch0, niv=21, njv=11}
grid0:write_to_vtk_file('circle.vtk')



