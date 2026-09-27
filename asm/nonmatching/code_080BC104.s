	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC104
sub_080BC104: @ 0x080BC104
	push {lr}
	sub sp, #4
	movs r0, #0
	bl SetOnHBlankA
	bl sub_080BC5CC
	bl EndFadeInOut
	movs r0, #0
	str r0, [sp]
	ldr r1, _080BC158 @ =0x02022860
	ldr r2, _080BC15C @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	ldr r2, _080BC160 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #2
	bl ResetTitleBgAffin
	bl EndEachSpriteAnimProc
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080BC158: .4byte 0x02022860
_080BC15C: .4byte 0x01000008
_080BC160: .4byte 0x03002870
