	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSupportTalk
StartSupportTalk: @ 0x08078A80
	push {r4, r5, r6, r7, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r5, #0
	ldr r0, _08078A94 @ =0x08C9F9F4
	b _08078AC2
	.align 2, 0
_08078A94: .4byte 0x08C9F9F4
_08078A98:
	adds r2, r1, #0
	ldrb r1, [r0, #1]
	cmp r2, r7
	bne _08078AA4
	cmp r1, r6
	beq _08078AAC
_08078AA4:
	cmp r1, r7
	bne _08078AC0
	cmp r2, r6
	bne _08078AC0
_08078AAC:
	cmp r4, #1
	bne _08078AB2
	ldr r5, [r0, #4]
_08078AB2:
	cmp r4, #2
	bne _08078AB8
	ldr r5, [r0, #8]
_08078AB8:
	cmp r4, #3
	bne _08078AC8
	ldr r5, [r0, #0xc]
	b _08078AC8
_08078AC0:
	adds r0, #0x14
_08078AC2:
	ldrb r1, [r0]
	cmp r1, #0
	bne _08078A98
_08078AC8:
	cmp r5, #0
	beq _08078AEC
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl GetSupportTalkSong
	adds r1, r0, #0
	adds r0, r5, #0
	bl CallMapSupportEvent
	bl sub_0800ADB8
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl UpdateBestGlobalSupportValue
_08078AEC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
