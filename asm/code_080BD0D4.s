	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BD0D4
sub_080BD0D4: @ 0x080BD0D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r1, [sp, #0x1c]
	ldr r0, _080BD108 @ =0x08CEF40C
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _080BD114
	lsls r0, r6, #5
	ldr r1, _080BD10C @ =0x02022860
	adds r0, r0, r1
	ldr r1, _080BD110 @ =0x020072C0
	movs r2, #8
	bl CpuFastSet
	b _080BD13A
	.align 2, 0
_080BD108: .4byte 0x08CEF40C
_080BD10C: .4byte 0x02022860
_080BD110: .4byte 0x020072C0
_080BD114:
	cmp r4, #0
	bne _080BD130
	str r4, [sp]
	ldr r1, _080BD128 @ =0x020072C0
	ldr r2, _080BD12C @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	b _080BD13A
	.align 2, 0
_080BD128: .4byte 0x020072C0
_080BD12C: .4byte 0x01000008
_080BD130:
	ldr r1, _080BD160 @ =0x020072C0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
_080BD13A:
	ldr r1, _080BD164 @ =0x020072E0
	adds r0, r7, #0
	movs r2, #8
	bl CpuFastSet
	movs r0, #0
	str r0, [r5, #0x30]
	str r6, [r5, #0x34]
	mov r0, r8
	str r0, [r5, #0x2c]
	bl EnablePalSync
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD160: .4byte 0x020072C0
_080BD164: .4byte 0x020072E0
