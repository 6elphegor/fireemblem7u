	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D210
sub_0807D210: @ 0x0807D210
	push {lr}
	ldr r0, _0807D234 @ =0x0202E3DC
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	ldrb r0, [r0, #3]
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807D238
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0807D238
	movs r0, #1
	b _0807D23A
	.align 2, 0
_0807D234: .4byte 0x0202E3DC
_0807D238:
	movs r0, #0
_0807D23A:
	pop {r1}
	bx r1
	.align 2, 0
