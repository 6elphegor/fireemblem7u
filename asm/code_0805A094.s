	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805A094
sub_0805A094: @ 0x0805A094
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _0805A0B0 @ =0x02020038
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805A0B4
	adds r1, #0xff
	movs r0, #0xfe
	bl PlaySFX
	b _0805A0BE
	.align 2, 0
_0805A0B0: .4byte 0x02020038
_0805A0B4:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xff
	bl PlaySFX
_0805A0BE:
	ldr r1, _0805A0CC @ =0x02020038
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805A0CC: .4byte 0x02020038
