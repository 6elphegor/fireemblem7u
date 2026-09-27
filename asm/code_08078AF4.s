	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSupportViewerTalk
StartSupportViewerTalk: @ 0x08078AF4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r5, #0
	ldr r1, _08078B04 @ =0x08C9F9F4
	b _08078B32
	.align 2, 0
_08078B04: .4byte 0x08C9F9F4
_08078B08:
	adds r0, r3, #0
	ldrb r3, [r1, #1]
	cmp r0, r6
	bne _08078B14
	cmp r3, r4
	beq _08078B1C
_08078B14:
	cmp r3, r6
	bne _08078B30
	cmp r0, r4
	bne _08078B30
_08078B1C:
	cmp r2, #1
	bne _08078B22
	ldr r5, [r1, #4]
_08078B22:
	cmp r2, #2
	bne _08078B28
	ldr r5, [r1, #8]
_08078B28:
	cmp r2, #3
	bne _08078B38
	ldr r5, [r1, #0xc]
	b _08078B38
_08078B30:
	adds r1, #0x14
_08078B32:
	ldrb r3, [r1]
	cmp r3, #0
	bne _08078B08
_08078B38:
	cmp r5, #0
	beq _08078B46
	adds r0, r5, #0
	bl CallSupportViewerEvent
	bl sub_0800ADB8
_08078B46:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
