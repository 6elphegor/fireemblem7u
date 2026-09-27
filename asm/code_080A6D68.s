	.include "macro.inc"

	.syntax unified

	thumb_func_start TactInfo_HandleCheckParticipantPrompt
TactInfo_HandleCheckParticipantPrompt: @ 0x080A6D68
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #2
	beq _080A6D7C
	bl GetTalkChoiceResult
	cmp r0, #0
	bne _080A6D92
_080A6D7C:
	ldr r1, _080A6D98 @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_080A6D92:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6D98: .4byte 0x0202BBF8
