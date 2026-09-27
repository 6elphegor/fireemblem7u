	.include "macro.inc"

	.syntax unified

	thumb_func_start InitBattleAnimFrame
InitBattleAnimFrame: @ 0x080542D8
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	ldr r4, _08054324 @ =0x02000000
	movs r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	ldr r5, _08054328 @ =0x0203E010
	ldrh r0, [r5]
	cmp r0, #1
	bne _080542F8
	adds r0, r2, #0
	bl InitLeftAnim
_080542F8:
	ldrh r5, [r5, #2]
	cmp r5, #1
	bne _08054304
	adds r0, r6, #0
	bl InitRightAnim
_08054304:
	ldr r0, _0805432C @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	bne _0805431E
	ldr r1, [r4]
	movs r2, #2
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r1, [r4, #4]
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
_0805431E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054324: .4byte 0x02000000
_08054328: .4byte 0x0203E010
_0805432C: .4byte 0x0203E02C
