	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B5554
sub_080B5554: @ 0x080B5554
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B5588 @ =0x08CE76E8
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x4a
	strb r4, [r1]
	strh r5, [r0, #0x30]
	strh r6, [r0, #0x32]
	mov r1, r8
	str r1, [r0, #0x2c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5588: .4byte 0x08CE76E8
