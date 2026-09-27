	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxCreateFrontAnim
EfxCreateFrontAnim: @ 0x0805041C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r0, _08050440 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050448
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08050444
	adds r0, r7, #0
	b _08050458
	.align 2, 0
_08050440: .4byte 0x0203E02C
_08050444:
	adds r0, r6, #0
	b _08050458
_08050448:
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08050456
	adds r0, r5, #0
	b _08050458
_08050456:
	ldr r0, [sp, #0x14]
_08050458:
	movs r1, #0x78
	bl AnimCreate
	adds r1, r0, #0
	movs r0, #0xa1
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r4, #2]
	strh r0, [r1, #2]
	ldrh r0, [r4, #4]
	strh r0, [r1, #4]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
