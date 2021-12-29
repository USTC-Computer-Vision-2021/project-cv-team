import argparse
from mask import mask
from inpaint import inpaint


parser = argparse.ArgumentParser(description='Demo')

parser.add_argument('--resume', default='cp/SiamMask_DAVIS.pth', type=str,
                    metavar='PATH', help='path to latest checkpoint (default: none)')
parser.add_argument('--data', default='data/Human6', help='videos or image files')
parser.add_argument('--mask-dilation', default=32, type=int, help='mask dilation when inpainting')
args = parser.parse_args()

mask(args)  #mask需要擦除的目标

inpaint(args)   #修复mask掉的部分

