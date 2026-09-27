	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepCheckCanUnselectUnit
PrepCheckCanUnselectUnit: @ 0x08093618
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093670
	adds r1, r5, #0
	adds r1, #0x29
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl RemoveSioPid
	ldr r0, _08093668 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093658
	ldr r0, _0809366C @ =0x0000038B
	bl m4aSongNumStart
_08093658:
	ldrh r0, [r5, #0x2e]
	lsrs r1, r0, #1
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
	movs r0, #1
	b _08093686
	.align 2, 0
_08093668: .4byte 0x0202BBF8
_0809366C: .4byte 0x0000038B
_08093670:
	ldr r0, _0809368C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093684
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08093684:
	movs r0, #0
_08093686:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809368C: .4byte 0x0202BBF8
