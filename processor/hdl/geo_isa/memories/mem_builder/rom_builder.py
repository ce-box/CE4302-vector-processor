MEMSIZE = 65536
IMGSIZE = 62500

def run():
    memfile = open('Processor\hdl\geo_isa\memories\mem_builder\\rom.mem','w')
    txtfile = open('Processor\hdl\geo_isa\memories\mem_builder\\text.txt','r')

    # Fill with zeros (image)
    for _ in range(IMGSIZE):
        memfile.write('0\n')
    
    # Write text
    line = IMGSIZE
    text = txtfile.read()
    #print(text)
    for c in text:
        ascii_char = str(ord(c))+'\n'
        #print(ascii_char)
        memfile.write(ascii_char)
        line += 1

    for _ in range(line, MEMSIZE):
        memfile.write('0\n')

    print('DONE ...')


if __name__ == '__main__':
    run()