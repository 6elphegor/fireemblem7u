	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809A870
sub_0809A870: @ 0x0809A870
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	bne _0809A894
	ldr r4, _0809A890 @ =0x08CC52D8
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #4
	b _0809A8BA
	.align 2, 0
_0809A890: .4byte 0x08CC52D8
_0809A894:
	cmp r0, #1
	beq _0809A8AC
	ldr r4, _0809A8A8 @ =0x08CC52D8
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #0xc
	b _0809A8BA
	.align 2, 0
_0809A8A8: .4byte 0x08CC52D8
_0809A8AC:
	ldr r4, _0809A8C4 @ =0x08CC52D8
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #8
_0809A8BA:
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809A8C4: .4byte 0x08CC52D8
