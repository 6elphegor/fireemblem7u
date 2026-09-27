	.include "macro.inc"

	.syntax unified

	thumb_func_start StartUiStandingMu
StartUiStandingMu: @ 0x0806BC88
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetClassSMSId
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x3c
	ldrb r1, [r2]
	bl StartUiSMS
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
