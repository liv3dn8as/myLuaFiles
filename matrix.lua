-- Edited by liv3dn8as; April 2017
-- I^2C Code

id  = 0 -- Always 0
sda = 1 -- A4 on Arduino; D2 on NodeMCU
scl = 2 -- A5 on Arduino; D1 on NodeMCU

-- initialize i2c, set pin1 as sda, set pin2 as scl
i2c.setup(id, sda, scl, i2c.SLOW)

-- user defined function: read from reg_addr content of dev_addr
function read_reg(dev_addr, reg_addr)
    i2c.start(id)
    i2c.address(id, dev_addr, i2c.TRANSMITTER)
    i2c.write(id, reg_addr)
    i2c.stop(id)
    i2c.start(id)
    i2c.address(id, dev_addr, i2c.RECEIVER)
    c = i2c.read(id, 1)
    i2c.stop(id)
    return c
end

-- get content of register 0xAA of device 0x70
reg = read_reg(0x70, 0xAA)
print(string.byte(reg))
