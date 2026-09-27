	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugPrintWithProc
DebugPrintWithProc: @ 0x0801B280
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	ldr r1, [r0, #0x2c]
	mov r8, r1
	ldr r4, [r0, #0x30]
	adds r1, r0, #0
	adds r1, #0x52
	ldrh r5, [r1]
	ldr r6, [r0, #0x54]
	add r0, sp, #4
	adds r1, r5, #0
	bl InitText
	add r0, sp, #4
	adds r1, r6, #0
	bl Text_DrawString
	adds r5, #2
	movs r0, #0
	str r0, [sp]
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #4
	bl DrawUiFrame2
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #1
	add r4, r8
	lsls r4, r4, #1
	ldr r0, _0801B2E0 @ =0x02022C60
	adds r4, r4, r0
	add r0, sp, #4
	adds r1, r4, #0
	bl PutText
	movs r0, #3
	bl EnableBgSync
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801B2E0: .4byte 0x02022C60
