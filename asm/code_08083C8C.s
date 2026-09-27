	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08083C8C
sub_08083C8C: @ 0x08083C8C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08083CE4 @ =0x0203E70C
	adds r0, r4, #0
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #8
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x10
	bl SpriteText_DrawBackground
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08083CD0
	bl GetDialogueBoxConfig
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _08083CD0
	adds r0, r4, #0
	adds r0, #0x18
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x20
	bl SpriteText_DrawBackground
_08083CD0:
	adds r0, r5, #0
	adds r0, #0x58
	movs r1, #0
	strb r1, [r0]
	subs r0, #0x10
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083CE4: .4byte 0x0203E70C
