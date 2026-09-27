	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B72A8
sub_080B72A8: @ 0x080B72A8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r5, _080B72CC @ =0x08CEDE04
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _080B72D0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x40
	strh r6, [r1]
	b _080B72D2
	.align 2, 0
_080B72CC: .4byte 0x08CEDE04
_080B72D0:
	movs r0, #0
_080B72D2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
