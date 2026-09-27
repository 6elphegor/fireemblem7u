	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804FF60
sub_0804FF60: @ 0x0804FF60
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, _0804FF8C @ =0x0203E00A
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0804FF90
	movs r2, #0x2c
	ldrsh r3, [r5, r2]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #4
	bl Interpolate
	adds r4, r0, #0
	bl EfxChapterMapFadeOUT
	b _0804FFC0
	.align 2, 0
_0804FF8C: .4byte 0x0203E00A
_0804FF90:
	movs r2, #0x2c
	ldrsh r3, [r5, r2]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	movs r2, #0
	ldrsh r0, [r6, r2]
	subs r0, #1
	bl PutBanimBgPAL
	ldr r0, _0804FFE8 @ =0x02022860
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
_0804FFC0:
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	adds r0, #1
	cmp r1, r0
	bne _0804FFE0
	ldr r1, _0804FFEC @ =0x02017778
	movs r0, #0
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0804FFE0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FFE8: .4byte 0x02022860
_0804FFEC: .4byte 0x02017778
