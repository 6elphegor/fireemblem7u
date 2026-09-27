	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08062158
sub_08062158: @ 0x08062158
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble _08062172
	ldrh r3, [r5, #0x2e]
	b _08062174
_08062172:
	ldrh r3, [r5, #0x2c]
_08062174:
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	ldr r7, _080621D8 @ =0x020165C8
	ldr r6, _080621DC @ =0x02022860
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	adds r0, r7, #0
	adds r1, r6, #0
	bl CpuFastSet
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r4, #0
	bl EfxPalWhiteInOut
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _080621CC
	adds r0, r7, #0
	adds r1, r6, #0
	mov r2, r8
	bl CpuFastSet
	ldr r1, _080621E0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080621CC:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080621D8: .4byte 0x020165C8
_080621DC: .4byte 0x02022860
_080621E0: .4byte 0x0201774C
