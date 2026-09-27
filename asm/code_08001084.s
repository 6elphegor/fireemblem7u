	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyPaletteExt
ApplyPaletteExt: @ 0x08001084
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #8]
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0
	beq _080010C0
	ldr r1, [r7, #4]
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, _080010BC @ =0x02022860
	adds r1, r0, r2
	ldr r0, [r7, #8]
	asrs r2, r0, #0x1f
	lsrs r3, r2, #0x1f
	adds r2, r0, r3
	asrs r0, r2, #1
	lsls r3, r0, #0xb
	lsrs r2, r3, #0xb
	ldr r0, [r7]
	bl CpuSet
	b _080010E2
	.align 2, 0
_080010BC: .4byte 0x02022860
_080010C0:
	ldr r1, [r7, #4]
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, _080010F0 @ =0x02022860
	adds r1, r0, r2
	ldr r2, [r7, #8]
	adds r0, r2, #0
	cmp r0, #0
	bge _080010D6
	adds r0, #3
_080010D6:
	asrs r0, r0, #2
	lsls r3, r0, #0xb
	lsrs r2, r3, #0xb
	ldr r0, [r7]
	bl CpuFastSet
_080010E2:
	bl EnablePalSync
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080010F0: .4byte 0x02022860
