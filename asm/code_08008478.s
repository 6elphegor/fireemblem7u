	.include "macro.inc"

	.syntax unified

	thumb_func_start TalkSpritePrepNextChar
TalkSpritePrepNextChar: @ 0x08008478
	push {lr}
	adds r1, r0, #0
	ldr r0, _08008498 @ =0x08B909B8
	ldr r2, [r0]
	ldrb r0, [r2, #9]
	ldrb r3, [r2, #0xa]
	cmp r0, r3
	blo _080084A0
	movs r0, #0
	strb r0, [r2, #0x12]
	ldr r0, _0800849C @ =0x08B90B4C
	bl Proc_StartBlocking
	movs r0, #1
	b _080084AC
	.align 2, 0
_08008498: .4byte 0x08B909B8
_0800849C: .4byte 0x08B90B4C
_080084A0:
	ldrb r0, [r2, #0x15]
	cmp r0, #0
	bne _080084AA
	movs r0, #1
	strb r0, [r2, #0x15]
_080084AA:
	movs r0, #0
_080084AC:
	pop {r1}
	bx r1
