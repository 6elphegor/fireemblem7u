	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitMiniPortraitId
GetUnitMiniPortraitId: @ 0x08018BF4
	adds r2, r0, #0
	ldr r1, [r2]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _08018C08
	movs r0, #0xfe
	lsls r0, r0, #7
	ldrb r1, [r1, #8]
	orrs r0, r1
	b _08018C1C
_08018C08:
	ldrh r0, [r1, #6]
	cmp r0, #0
	bne _08018C18
	ldr r2, [r2, #4]
	ldrh r0, [r2, #8]
	movs r1, #0
	cmp r0, #0
	beq _08018C1A
_08018C18:
	adds r1, r0, #0
_08018C1A:
	adds r0, r1, #0
_08018C1C:
	bx lr
	.align 2, 0
