	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804FF04
sub_0804FF04: @ 0x0804FF04
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0804FF24 @ =0x0203E00A
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0804FF2C
	ldr r0, _0804FF28 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl UnpackChapterMapGraphics
	bl RenderMap
	b _0804FF36
	.align 2, 0
_0804FF24: .4byte 0x0203E00A
_0804FF28: .4byte 0x0202BBF8
_0804FF2C:
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r0, #1
	bl PutBanimBG
_0804FF36:
	ldr r0, _0804FF5C @ =0x02022860
	movs r1, #6
	movs r2, #0xa
	movs r3, #0x10
	bl EfxPalBlackInOut
	bl EnablePalSync
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #4
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FF5C: .4byte 0x02022860
