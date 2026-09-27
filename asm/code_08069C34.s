	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxleveluphb
NewEfxleveluphb: @ 0x08069C34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _08069CD0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r2, _08069CD4 @ =0x0201FB2C
	movs r1, #0
	adds r6, r2, #0
	ldr r4, _08069CD8 @ =0x0201FC6C
	ldr r0, _08069CDC @ =0x0201FDB8
	ldr r5, _08069CE0 @ =0x0201FEF8
	ldr r7, _08069CE4 @ =0x0201FB20
	ldr r3, _08069CE8 @ =0x0201FDAC
	mov ip, r3
	ldr r3, _08069CEC @ =0x0201FB24
	mov r8, r3
	ldr r3, _08069CF0 @ =0x0201FDB0
	mov sb, r3
	ldr r3, _08069CF4 @ =0x0201FB28
	mov sl, r3
	movs r3, #0
_08069C66:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08069C66
	adds r2, r4, #0
	movs r1, #0
	movs r3, #0
_08069C76:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08069C76
	adds r2, r0, #0
	movs r1, #0
	movs r3, #0
_08069C86:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08069C86
	adds r2, r5, #0
	movs r1, #0
	movs r3, #0
_08069C96:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08069C96
	movs r4, #0
	str r4, [r7]
	mov r1, ip
	str r4, [r1]
	mov r3, r8
	str r6, [r3]
	mov r1, sb
	str r0, [r1]
	mov r3, sl
	str r6, [r3]
	ldr r1, _08069CF8 @ =0x0201FDB4
	str r0, [r1]
	ldr r0, _08069CFC @ =0x08BDB72C
	movs r1, #0
	bl Proc_Start
	strh r4, [r0, #0x2c]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08069CD0: .4byte 0x0201774C
_08069CD4: .4byte 0x0201FB2C
_08069CD8: .4byte 0x0201FC6C
_08069CDC: .4byte 0x0201FDB8
_08069CE0: .4byte 0x0201FEF8
_08069CE4: .4byte 0x0201FB20
_08069CE8: .4byte 0x0201FDAC
_08069CEC: .4byte 0x0201FB24
_08069CF0: .4byte 0x0201FDB0
_08069CF4: .4byte 0x0201FB28
_08069CF8: .4byte 0x0201FDB4
_08069CFC: .4byte 0x08BDB72C
