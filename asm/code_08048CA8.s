	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08048CA8
sub_08048CA8: @ 0x08048CA8
	push {lr}
	ldr r0, _08048CC4 @ =0x081C9D88
	ldr r1, _08048CC8 @ =0x06002000
	bl Decompress
	ldr r0, _08048CCC @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #1
	beq _08048CF4
	cmp r0, #1
	bgt _08048CD0
	cmp r0, #0
	beq _08048CDA
	b _08048D3E
	.align 2, 0
_08048CC4: .4byte 0x081C9D88
_08048CC8: .4byte 0x06002000
_08048CCC: .4byte 0x0202BBF8
_08048CD0:
	cmp r0, #2
	beq _08048D0C
	cmp r0, #3
	beq _08048D2C
	b _08048D3E
_08048CDA:
	ldr r0, _08048CE8 @ =0x081C8AB4
	ldr r1, _08048CEC @ =0x06002800
	bl Decompress
	ldr r0, _08048CF0 @ =0x081C9EE8
	b _08048D16
	.align 2, 0
_08048CE8: .4byte 0x081C8AB4
_08048CEC: .4byte 0x06002800
_08048CF0: .4byte 0x081C9EE8
_08048CF4:
	ldr r0, _08048D00 @ =0x081C8F64
	ldr r1, _08048D04 @ =0x06002800
	bl Decompress
	ldr r0, _08048D08 @ =0x081C9F28
	b _08048D16
	.align 2, 0
_08048D00: .4byte 0x081C8F64
_08048D04: .4byte 0x06002800
_08048D08: .4byte 0x081C9F28
_08048D0C:
	ldr r0, _08048D20 @ =0x081C9424
	ldr r1, _08048D24 @ =0x06002800
	bl Decompress
	ldr r0, _08048D28 @ =0x081C9F08
_08048D16:
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	b _08048D3E
	.align 2, 0
_08048D20: .4byte 0x081C9424
_08048D24: .4byte 0x06002800
_08048D28: .4byte 0x081C9F08
_08048D2C:
	ldr r0, _08048D50 @ =0x081C98D4
	ldr r1, _08048D54 @ =0x06002800
	bl Decompress
	ldr r0, _08048D58 @ =0x081C9F48
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
_08048D3E:
	ldr r2, _08048D5C @ =0x0300144C
	ldr r1, _08048D60 @ =0x0202BBF8
	ldrb r0, [r1, #0xf]
	str r0, [r2]
	movs r0, #0
	strb r0, [r1, #0xf]
	pop {r0}
	bx r0
	.align 2, 0
_08048D50: .4byte 0x081C98D4
_08048D54: .4byte 0x06002800
_08048D58: .4byte 0x081C9F48
_08048D5C: .4byte 0x0300144C
_08048D60: .4byte 0x0202BBF8
