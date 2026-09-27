	.include "macro.inc"

	.syntax unified

	thumb_func_start DisplayExtendedSysHand
DisplayExtendedSysHand: @ 0x080A9364
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetGameTime
	ldr r1, _080A9424 @ =0x02022860
	ldrh r3, [r5, #0x3a]
	lsls r2, r3, #5
	movs r4, #0x87
	lsls r4, r4, #2
	adds r2, r2, r4
	adds r2, r2, r1
	ldr r1, _080A9428 @ =0x0202BBF8
	adds r1, #0x41
	ldrb r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #4
	lsrs r0, r0, #2
	movs r4, #0xf
	ands r0, r4
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080A942C @ =0x0840DD24
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x30]
	adds r2, #8
	ldr r3, _080A9430 @ =0x08B905B0
	ldrh r0, [r5, #0x3a]
	ands r4, r0
	lsls r4, r4, #0xc
	ldrh r0, [r5, #0x3c]
	adds r4, r0, r4
	ldrh r0, [r5, #0x36]
	adds r4, r0, r4
	str r4, [sp]
	movs r0, #4
	bl PutSpriteExt
	movs r4, #1
	ldrh r1, [r5, #0x38]
	cmp r4, r1
	bge _080A93F2
_080A93C4:
	lsls r0, r4, #3
	ldr r1, [r5, #0x2c]
	adds r1, r1, r0
	ldr r2, [r5, #0x30]
	adds r2, #8
	movs r0, #0xf
	ldrh r3, [r5, #0x3a]
	ands r0, r3
	lsls r0, r0, #0xc
	ldrh r3, [r5, #0x3c]
	adds r0, r3, r0
	ldrh r3, [r5, #0x36]
	adds r0, r3, r0
	adds r0, #1
	str r0, [sp]
	movs r0, #4
	ldr r3, _080A9430 @ =0x08B905B0
	bl PutSpriteExt
	adds r4, #1
	ldrh r0, [r5, #0x38]
	cmp r4, r0
	blt _080A93C4
_080A93F2:
	ldrh r1, [r5, #0x38]
	lsls r0, r1, #3
	ldr r1, [r5, #0x2c]
	adds r1, r1, r0
	ldr r2, [r5, #0x30]
	adds r2, #8
	ldr r3, _080A9430 @ =0x08B905B0
	movs r0, #0xf
	ldrh r4, [r5, #0x3a]
	ands r0, r4
	lsls r0, r0, #0xc
	ldrh r4, [r5, #0x3c]
	adds r0, r4, r0
	ldrh r5, [r5, #0x36]
	adds r0, r5, r0
	adds r0, #2
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9424: .4byte 0x02022860
_080A9428: .4byte 0x0202BBF8
_080A942C: .4byte 0x0840DD24
_080A9430: .4byte 0x08B905B0
