	.include "macro.inc"

	.syntax unified

	thumb_func_start AiUpdateUnitsSeekHealing
AiUpdateUnitsSeekHealing: @ 0x08039704
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _08039754 @ =0x0202BBF8
	ldrb r2, [r0, #0xf]
	mov r1, sp
	ldr r0, _08039758 @ =0x081D3B68
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	movs r5, #0
	lsrs r0, r2, #6
	lsls r0, r0, #2
	mov r3, sp
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r5, r0
	bge _0803974A
	adds r6, r1, #0
	adds r4, r2, #1
_08039728:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08039740
	ldr r0, [r1]
	cmp r0, #0
	beq _08039740
	adds r0, r1, #0
	bl AiUpdateGetUnitIsHealing
_08039740:
	adds r4, #1
	adds r5, #1
	ldr r0, [r6]
	cmp r5, r0
	blt _08039728
_0803974A:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039754: .4byte 0x0202BBF8
_08039758: .4byte 0x081D3B68
