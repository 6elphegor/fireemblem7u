	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080845C8
sub_080845C8: @ 0x080845C8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080845FC @ =0x08CC2B6C
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	cmp r5, #0
	bge _080845E2
	adds r5, #7
_080845E2:
	asrs r0, r5, #3
	str r0, [r1, #0x2c]
	adds r0, r6, #0
	cmp r6, #0
	bge _080845EE
	adds r0, #0xf
_080845EE:
	asrs r0, r0, #4
	cmp r0, #5
	bgt _08084600
	cmp r0, #0
	bge _08084602
	movs r0, #0
	b _08084602
	.align 2, 0
_080845FC: .4byte 0x08CC2B6C
_08084600:
	movs r0, #5
_08084602:
	str r0, [r1, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
