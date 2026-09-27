	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrDragonBg3HfScroll
NewEkrDragonBg3HfScroll: @ 0x08065DC8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _08065E2C @ =0x0201FDB8
	movs r2, #0
	adds r0, r3, #0
	ldr r4, _08065E30 @ =0x0201FEF8
	ldr r5, _08065E34 @ =0x0201FDAC
	ldr r6, _08065E38 @ =0x0201FDB0
	ldr r7, _08065E3C @ =0x0201FDB4
	mov sb, r7
	ldr r7, _08065E40 @ =sub_08065DA0
	mov ip, r7
_08065DEA:
	strh r1, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #0x9f
	bls _08065DEA
	adds r3, r4, #0
	movs r2, #0
_08065DF8:
	strh r1, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #0x9f
	bls _08065DF8
	movs r4, #0
	str r4, [r5]
	str r0, [r6]
	mov r1, sb
	str r0, [r1]
	mov r0, ip
	bl SetOnHBlankA
	ldr r0, _08065E44 @ =0x08BD94F0
	movs r1, #0
	bl Proc_Start
	strh r4, [r0, #0x2c]
	mov r7, r8
	str r7, [r0, #0x44]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065E2C: .4byte 0x0201FDB8
_08065E30: .4byte 0x0201FEF8
_08065E34: .4byte 0x0201FDAC
_08065E38: .4byte 0x0201FDB0
_08065E3C: .4byte 0x0201FDB4
_08065E40: .4byte sub_08065DA0
_08065E44: .4byte 0x08BD94F0
