	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2DAC
sub_080B2DAC: @ 0x080B2DAC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	bl SetInitTalkTextFont
	bl ClearTalkText
	ldr r0, [r7]
	bl DecodeMsg
	adds r2, r0, #0
	ldr r3, [r7, #4]
	movs r0, #8
	movs r1, #2
	bl StartTalkExt
	movs r0, #0
	bl SetTalkPrintColor
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #1
	bl SetActiveTalkFace
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
