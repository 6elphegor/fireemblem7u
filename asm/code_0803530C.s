	.include "macro.inc"

	.syntax unified

	thumb_func_start AiStartEscapeAction
AiStartEscapeAction: @ 0x0803530C
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _08035344 @ =0x081D3664
	mov r0, sp
	movs r2, #0xc
	bl memcpy
	ldr r1, _08035348 @ =0x0203A97C
	ldrb r0, [r1, #8]
	cmp r0, #5
	beq _0803533A
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803533A
	ldrb r2, [r1, #8]
	lsls r0, r2, #1
	adds r0, r0, r2
	add r0, sp
	bl SetAutoMuMoveScript
_0803533A:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035344: .4byte 0x081D3664
_08035348: .4byte 0x0203A97C
