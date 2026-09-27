	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080998D8
sub_080998D8: @ 0x080998D8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08088A90
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080998EE
	adds r0, r4, #0
	bl Proc_Break
	b _08099916
_080998EE:
	ldr r0, _0809991C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08099916
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _08099920 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099916
	ldr r0, _08099924 @ =0x0000038B
	bl m4aSongNumStart
_08099916:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809991C: .4byte 0x08B857F8
_08099920: .4byte 0x0202BBF8
_08099924: .4byte 0x0000038B
