	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxTeonoObj2Main
EfxTeonoObj2Main: @ 0x080566D4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _08056706
	ldr r1, _0805670C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r1, _08056710 @ =0x02017758
	movs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08056706:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805670C: .4byte 0x0201774C
_08056710: .4byte 0x02017758
