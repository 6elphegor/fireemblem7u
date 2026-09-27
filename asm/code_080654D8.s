	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragon_ReloadCustomBgAndFadeOut
EkrDragon_ReloadCustomBgAndFadeOut: @ 0x080654D8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080654F6
	ldr r0, _0806552C @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl UnpackChapterMapGraphics
	bl RenderMap
_080654F6:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #4
	bl Interpolate
	bl EfxChapterMapFadeOUT
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08065524
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_08065524:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806552C: .4byte 0x0202BBF8
