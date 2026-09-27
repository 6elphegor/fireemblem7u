	.include "macro.inc"

	.syntax unified

	thumb_func_start StartYesNoChoice
StartYesNoChoice: @ 0x08088B88
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov r8, r1
	adds r4, r2, #0
	mov sb, r3
	ldr r6, [sp, #0x1c]
	ldr r7, [sp, #0x24]
	ldr r0, [r5]
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0x10
	adds r2, r6, #0
	bl Text_InsertDrawString
	ldr r0, [r5, #4]
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0x38
	adds r2, r6, #0
	bl Text_InsertDrawString
	ldr r0, _08088BE4 @ =0x08CC3174
	adds r1, r7, #0
	bl Proc_StartBlocking
	mov r1, sp
	ldrh r1, [r1, #0x20]
	strh r1, [r0, #0x2a]
	adds r4, #0x10
	strh r4, [r0, #0x2c]
	mov r2, sb
	strh r2, [r0, #0x2e]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088BE4: .4byte 0x08CC3174
