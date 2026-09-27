	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenuDrawSubSelBox
SaveMenuDrawSubSelBox: @ 0x080A5F98
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _080A5FCC @ =0x08CE435C
	adds r0, #0x42
	ldrb r0, [r0]
	bl BitfileToIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r5
	ldr r0, [r0]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r1, r4, #0
	bl SaveMenuDrawSubSelBoxExt
	cmp r4, #0
	bne _080A5FC6
	adds r0, r6, #0
	adds r0, #0x36
	strb r4, [r0]
_080A5FC6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5FCC: .4byte 0x08CE435C
