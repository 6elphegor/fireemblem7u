	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearHelpBoxText
ClearHelpBoxText: @ 0x08082D98
	push {r4, lr}
	ldr r4, _08082DD4 @ =0x0203E6A0
	adds r0, r4, #0
	bl SetTextFont
	adds r0, r4, #0
	adds r0, #0x18
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x20
	bl SpriteText_DrawBackground
	adds r4, #0x28
	adds r0, r4, #0
	bl SpriteText_DrawBackground
	ldr r0, _08082DD8 @ =0x08CC2994
	bl Proc_EndEach
	ldr r0, _08082DDC @ =0x08CC29BC
	bl Proc_EndEach
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082DD4: .4byte 0x0203E6A0
_08082DD8: .4byte 0x08CC2994
_08082DDC: .4byte 0x08CC29BC
