	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BB81C
sub_080BB81C: @ 0x080BB81C
	push {r4, r5, r6, lr}
	sub sp, #0x24
	adds r6, r0, #0
	ldr r1, _080BB8DC @ =0x08677324
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl InitBgs
	movs r0, #1
	bl FadeBgmOut
	movs r4, #0
	str r4, [sp, #0x18]
	add r0, sp, #0x18
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r5, _080BB8E0 @ =0x01000008
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #0x1c]
	add r0, sp, #0x1c
	ldr r1, _080BB8E4 @ =0x06008000
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #0x20]
	add r0, sp, #0x20
	ldr r1, _080BB8E8 @ =0x06010000
	adds r2, r5, #0
	bl CpuFastSet
	ldr r5, _080BB8EC @ =0x02022860
	movs r4, #0x1f
_080BB866:
	ldr r0, _080BB8F0 @ =0x086005C4
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080BB866
	bl EnablePalSync
	ldr r4, _080BB8F4 @ =0x03002870
	adds r3, r4, #0
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r0, [r3]
	ands r1, r0
	adds r2, r4, #0
	adds r2, #0x44
	movs r0, #0
	strb r0, [r2]
	adds r2, #1
	strb r0, [r2]
	adds r2, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	strb r1, [r3]
	adds r1, r4, #0
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	movs r0, #2
	bl ResetTitleBgAffin
	bl sub_08002CA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BB8F8
	adds r0, r6, #0
	bl sub_080BB800
	b _080BB8FE
	.align 2, 0
_080BB8DC: .4byte 0x08677324
_080BB8E0: .4byte 0x01000008
_080BB8E4: .4byte 0x06008000
_080BB8E8: .4byte 0x06010000
_080BB8EC: .4byte 0x02022860
_080BB8F0: .4byte 0x086005C4
_080BB8F4: .4byte 0x03002870
_080BB8F8:
	adds r0, r6, #0
	bl sub_080BB814
_080BB8FE:
	adds r0, r6, #0
	bl sub_080BC5B8
	ldr r4, _080BB95C @ =0x085EE004
	ldr r1, _080BB960 @ =0x06017000
	adds r0, r4, #0
	bl Decompress
	ldr r1, _080BB964 @ =0x06017400
	adds r0, r4, #0
	bl Decompress
	ldr r1, _080BB968 @ =0x06017800
	adds r0, r4, #0
	bl Decompress
	ldr r1, _080BB96C @ =0x06017C00
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080BB970 @ =0x08616FC4
	ldr r1, _080BB974 @ =0x08CEF078
	ldr r1, [r1]
	bl Decompress
	ldr r0, _080BB978 @ =0x086758E0
	ldr r1, _080BB97C @ =0x08CEF07C
	ldr r1, [r1]
	bl Decompress
	ldr r0, _080BB980 @ =0x0867453C
	ldr r1, _080BB984 @ =0x08CEF080
	ldr r1, [r1]
	bl Decompress
	ldr r0, _080BB988 @ =0x08CEF0E4
	adds r1, r6, #0
	bl Proc_Start
	movs r0, #3
	bl SetNextGameAction
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB95C: .4byte 0x085EE004
_080BB960: .4byte 0x06017000
_080BB964: .4byte 0x06017400
_080BB968: .4byte 0x06017800
_080BB96C: .4byte 0x06017C00
_080BB970: .4byte 0x08616FC4
_080BB974: .4byte 0x08CEF078
_080BB978: .4byte 0x086758E0
_080BB97C: .4byte 0x08CEF07C
_080BB980: .4byte 0x0867453C
_080BB984: .4byte 0x08CEF080
_080BB988: .4byte 0x08CEF0E4
