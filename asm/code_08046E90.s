	.include "macro.inc"

	.syntax unified

	thumb_func_start LinkArena_StoreTalkChoice
LinkArena_StoreTalkChoice: @ 0x08046E90
	push {lr}
	bl GetTalkChoiceResult
	adds r1, r0, #0
	cmp r1, #1
	bne _08046EA8
	ldr r0, _08046EA4 @ =0x0203DC9C
	strb r1, [r0, #8]
	b _08046EAE
	.align 2, 0
_08046EA4: .4byte 0x0203DC9C
_08046EA8:
	ldr r1, _08046EB4 @ =0x0203DC9C
	movs r0, #0
	strb r0, [r1, #8]
_08046EAE:
	pop {r0}
	bx r0
	.align 2, 0
_08046EB4: .4byte 0x0203DC9C
