	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803A090
sub_0803A090: @ 0x0803A090
	ldr r2, _0803A0B4 @ =0x0202E3DC
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r1, [r1]
	cmp r1, #0
	beq _0803A0B0
	ldr r0, _0803A0B8 @ =0x0202BD48
	ldrb r0, [r0]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803A0BC
_0803A0B0:
	movs r0, #0
	b _0803A0BE
	.align 2, 0
_0803A0B4: .4byte 0x0202E3DC
_0803A0B8: .4byte 0x0202BD48
_0803A0BC:
	movs r0, #1
_0803A0BE:
	bx lr
